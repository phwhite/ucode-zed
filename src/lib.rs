use zed_extension_api as zed;

struct UCodeExtension;

impl zed::Extension for UCodeExtension {
    fn new() -> Self {
        Self
    }

    // Optional: add methods later (e.g., language_server_command) when needed.
}

zed::register_extension!(UCodeExtension);

