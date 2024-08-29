let license = variable::get("license");
while switch license.to_upper() {
    "MIT OR APACHE-2.0" => {
        false
    }
    "MIT" => {
        file::delete("LICENSE-APACHE");
        file::rename("LICENSE-MIT", "LICENSE");
        false
    }
    "APACHE-2.0" => {
        file::delete("LICENSE-MIT");
        file::rename("LICENSE-APACHE", "LICENSE");
        false
    }
    "Unlicensed" => {
        file::delete("LICENSE-MIT");
        file::delete("LICENSE-APACHE");
        false
    }
    _ => true,
} {
    license = variable::prompt(
        "Choose a license for your project:",
        "MIT OR Apache-2.0",
        [
            "MIT OR Apache-2.0",
            "MIT",
            "Apache-2.0",
            "Unlicensed",
        ]
    );
}