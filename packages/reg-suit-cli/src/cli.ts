#!node

import * as yargs from "yargs";

import {
  RegSuitCore
} from "reg-suit-core/lib/core";

interface CliOptions {
  command: string;
  configFileName?: string;
}

function createOptions() {
  yargs
    .alias("c", "config")
    .alias("v", "verbose")
    .command("run", "run all")
  ;
  const config = yargs.argv["config"];
  console.log(yargs.argv);
  const command = yargs.argv._[0] || "run";
  return { 
    command,
    configFileName: config,
  } as CliOptions;
}

function run(options: CliOptions) {
  const core = new RegSuitCore();
  core.init(options.configFileName);
  core.runAll();
}

function cli() {
  const options = createOptions();
  if (options.command === "run") {
    run(options);
  }
}

cli();
