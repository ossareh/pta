const std = @import("std");

const yazap = @import("yazap");

const pta = @import("pta");

const App = yazap.App;
const Arg = yazap.Arg;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit(); // Ensure allocator resources are freed
    const allocator = gpa.allocator();

    var app = App.init(allocator, "pta", "Plain Text Accounting TUI");
    defer app.deinit(); // Ensure yazap resources are freed

    var root_cmd = app.rootCommand();
    root_cmd.setProperty(.help_on_empty_args);

    // import <csv>
    var import_cmd = app.createCommand("import", "Import transaction data from csv file");
    import_cmd.setProperty(.help_on_empty_args);
    import_cmd.setProperty(.positional_arg_required);
    try import_cmd.addArg(Arg.positional(
        "CSV", // The name shown in help messages and used for retrieval
        "The path to the transaction CSV to import",
        null, // The index (null lets yazap determine it automatically)
    ));

    try root_cmd.addSubcommand(import_cmd);

    const matches = try app.parseProcess();

    if (matches.subcommandMatches("import")) |import_matches| {
        if (import_matches.getSingleValue("CSV")) |file_path| {
            std.log.info("Import subcommand called with file: {s}", .{file_path});
            return;
        }
        return;
    }
}

test "simple test" {}
