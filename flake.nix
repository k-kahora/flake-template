{
  description = "A simple flake temlpate"
  outputs = {self}: {

    templates = {
      example = {
        path = ./example;
	description = "A super basic flake";
      };
    };

    defaultTemplate = self.templates.example;
  };
}

