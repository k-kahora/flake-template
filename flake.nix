{
  description = "A simple flake temlpate";
  outputs = {self}: {

    templates = {
      ocaml = {
        path = ./ocaml;
        description = "Basic ocaml shell flake";
        welcomText = ''
          # Simple dev shell for ocaml
          ## Intended use
          Starting up basic ocaml projects
        '';
      };
      example = {
        path = ./example;
        description = "A super basic flake";
      };
    };

    defaultTemplate = self.templates.example;
  };
}

