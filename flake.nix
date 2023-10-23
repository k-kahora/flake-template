{
  description = "A simple flake temlpate";
  outputs = {self}: {

    templates = {
      web = {
        path = ./web;
        description = "Basic lsps and installs for simple webdeg";
        welcomeText = ''
          # Simple dev shell html,js, and css
          ## Intended use
          Work in simple html files
        '';
      };
      ocaml = {
        path = ./ocaml;
        description = "Basic ocaml shell flake";
        welcomeText = ''
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

