import yargs from "yargs"
import MDBReader from "mdb-reader";
import { readFileSync, writeFileSync } from "fs";

export function run() {

    const argv = yargs(process.argv)
        .help()
        .alias("help", "h")
        .command("json", "Prints out the contents of the mdb file as JSON")
        .option("input", {
            alias: 'i',
            description: "The path to the source mdb file",
            type: 'string',
            demandOption: true
        })
        .option("output", {
            alias: 'o',
            description: " The path to the file where data will be output. If omitted the console is used instead"
        })
        .command("db <host> <port> <user> <pass>", "Adapts the data from the MDB file into the provided SQL database")
        .argv;

    const buffer = readFileSync(argv.input);

    const logger = !argv.output || argv.output == "stdout" ? console.log : (str) => writeFileSync(argv.output, str);

    if (argv._.includes("json")) {
        const json = parseToJsonString(buffer);
        logger(json);
    } else if (argv._.includes("db")) {
        console.log("TODO")
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