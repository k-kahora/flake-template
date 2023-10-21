{
  description = "A simple flake temlpate";
  outputs = {self}: {

    templates = {
      ocaml = {
        path = ./ocaml;
        description = "Basic ocaml shell flake";
      };
      example = {
        path = ./example;
        description = "A super basic flake";
      };
    };

    defaultTemplate = self.templates.example;
  };
}

