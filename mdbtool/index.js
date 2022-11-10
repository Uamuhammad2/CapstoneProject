import yargs from "yargs"
import MDBReader from "mdb-reader";
import { readFileSync } from "fs";

export function run() {

    const argv = yargs(process.argv)
        .help()
        .command("json", "Prints out the contents of the mdb file as JSON")
        .option("file", {
            alias: 'f',
            description: "The source file",
            type: 'string',
            demandOption: true
        })
        .alias("help", "h")
        .argv;

    const buffer = readFileSync(argv.file);

    if (argv._.includes("json")) {
        console.log(parseToJsonString(buffer))
    } else {
        console.error("Unsupported command given");
    }

}

export function parseToObject(buffer) {
    const reader = new MDBReader(buffer);

    const res = {
        names: reader.getTableNames(),
        tables: {}
    };

    res.names.forEach(name => {
        const table = reader.getTable(name);
        res.tables[name] = {
            column_names: table.getColumnNames(),
            rows: table.getData()
        };
    })
    return res;
}

export function parseToJsonString(buffer) {
    return JSON.stringify(parseToObject(buffer));
}

run();