# boilerplate::loader::module_generic
_inputs@{ cell, inputs, }:
let inherit (inputs.cells.lib.functions.modules) loadModules;
in loadModules ./darwinProfiles _inputs
