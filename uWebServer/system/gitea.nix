    { config, pkgs, lib, ... }:

    {

      services.gitea = {
        enable = true;                               # Enable Gitea
        appName = "Krutonium's Gitea Service";         # Give the site a name
        database = {
          type = "sqlite3";                         # Database type
          # passwordFile = "/run/keys/gitea-dbpass";   # Where to find the password
        };
        domain = "gitea.krutonium.ca";              # Domain name
        rootUrl = "https://gitea.krutonium.ca/";   # Root web URL
        httpPort = 3001;                             # Provided unique port
        cookieSecure = true;
        #SSH_PORT = 23;
        #sshUrl = "krutonium.ca:23";
        ssh.enable = false;
	disableRegistration = true;
        #extraConfig = let
        #  docutils =
        #    pkgs.python37.withPackages (ps: with ps; [
        #      docutils                               # Provides rendering of ReStructured Text files
        #      pygments                               # Provides syntax highlighting
        #  ]);
        #in ''
        #  [mailer]
        #  ENABLED = false
        #  FROM = "gitea@mydomain.tld"
        #  [service]
        #  REGISTER_EMAIL_CONFIRM = true
        #  [markup.restructuredtext]
        #  ENABLED = false
        #  FILE_EXTENSIONS = .rst
        #  RENDER_COMMAND = ${docutils}/bin/rst2html.py
        #  IS_INPUT_FILE = false
        #'';
      };

      services.nginx = {
        enable = true;                                          # Enable Nginx
        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;
        virtualHosts."gitea.krutonium.ca" = {                  # Gitea hostname
          enableACME = true;                                    # Use ACME certs
          forceSSL = true;                                      # Force SSL
          locations."/".proxyPass = "http://localhost:3001/";   # Proxy Gitea
        };
      };

      security.acme.certs = {
          "gitea.krutonium.ca".email = "PFCKrutonium@gmail.com";
      };
      security.acme.email = "PFCKrutonium@gmail.com";
      security.acme.acceptTerms = true;
    }
