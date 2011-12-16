# Perl buildpack

## Using

    heroku create --stack cedar --buildpack <your-github-url>
    
By default, .pl files will be served.

## Libraries

/lib in your application is added to the perl library search path

## Customizing

By default, we generate a .htaccess like this:

    # Serve .pl scripts
    SetHandler perl-script
    PerlResponseHandler ModPerl::Registry
    PerlOptions +ParseHeaders
    Options +ExecCGI
    Order allow,deny
    Allow from all 
    DirectoryIndex index.pl

If you provide your own .htaccess it will override this, so you can set custom handlers etc.

## Creating the binaries

Run `vagrant up` in the packager dir. This will compile the required executables.
