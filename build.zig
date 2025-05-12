const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    
    const exe = b.addExecutable(.{
        .name = "unbrowser", 
        .root_source_file = .{ .path = "unbrowser.c" }, 
        .target = target,
        .optimize = optimize,
    });

    exe.linkSystemLibrary("c");

    b.default_step.dependOn(&exe.step);

    const install_step = b.step("install", "Install the application");

    install_step.dependOn(b.addInstallArtifact(exe, .{}));

    install_step.dependOn(b.addInstallFile(
        .{ .path = "unbrowser.desktop" },
        "share/applications/unbrowser.desktop", 
    ));

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep()); 

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the application");
    run_step.dependOn(&run_cmd.step);
}
