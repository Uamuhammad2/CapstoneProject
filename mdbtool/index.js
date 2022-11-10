import yargs from "yargs"

export function run() {

    const argv = yargs(process.argv)
        .help()
        .command("json", "Prints out the contents of the mdb file as JSON", {

        })
        .option("file", {
            alias: 'f',
            description: "The source file",
            type: 'string',
            demandOption: true
        })
        .alias("help", "h")
        .argv;

    if (argv._.includes("json")) {
        console.log(parseToJsonString(argv.file))
    } else {
        console.error("Unsupported command given");
    }

}

export function parseToJsonString(fileName) {

}

run();