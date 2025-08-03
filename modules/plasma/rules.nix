{ pkgs, ...}:{


    programs = {
        plasma = {
        window-rules = [
               {description = "Window settings for Vesktop";
                match = {
                    window-class = {
                        value = "vesktop";
                        type = "exact";
                        match-whole = false;
                        };

                    title = {
                        value = "vesktop";
                        type = "regex"; };

                        };

                apply = {
                    desktops = {
                        value = "Desktop_3";
                        apply = "force";
                        };
                    };
                };


                {description = "Window settings for Brave";
                match = {
                    window-class = {
                        value = "brave brave-broser";
                        type = "exact";
                        match-whole = true;
                        };

                    title = {
                        value = "brave";
                        type = "regex"; };

                        };

                apply = {
                    desktops = {
                        value = "Desktop_1";
                        apply = "initially";
                        };
                    };
                };


                {description = "Window settings for ZapZap";
                match = {
                    window-class = {
                        value = "com.rtosta.zapzap";
                        type = "exact";
                        match-whole = true;
                        };

                    title = {
                        value = "ZapZap";
                        type = "normal"; };

                        };

                apply = {
                    desktops = {
                        value = "Desktop_2";
                        apply = "force";
                        };
                    };
                };



        ];

    };

}
