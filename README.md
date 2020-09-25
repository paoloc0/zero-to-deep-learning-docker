
# Zero to Deep Learning book Docker launcher

If you have purchased the _Zero to Deep Learning_ book (https://book.zerotodeeplearning.com/), and don't want to struggle with the Python build or dependencies to get up and running, read on.


## Prerequisites

You only need to have Docker installed.

In the current directory, where this README was found, unzip the _Zero to Deep Learning_ ZIP file, e.g.:

```
$ unzip ../zero-to-deep-learning-1.1-code.zip
Archive:  ../zero-to-deep-learning-1.1-code.zip
   creating: full/
[etc.]
```

## Docker build

You only need to do this once (but it will take a while):

```
$ docker build -t zero-to-deep-learning .
```

## Docker run

Assuming that nothing is already listening on port 8080 on your host machine, the following will (run the project in Docker and) map that port onto the Docker container(also listening on port 8080):
```
$ docker run --rm -it -p 8080:8080 -v $PWD/full:/zero-to-deep-learning zero-to-deep-learning
```

A normal startup should output something similar to this:
```
[I 12:43:43.635 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
[I 12:43:43.894 NotebookApp] Serving notebooks from local directory: /zero-to-deep-learning
[I 12:43:43.895 NotebookApp] The Jupyter Notebook is running at:
[I 12:43:43.895 NotebookApp] http://077c3157efbd:8080/?token=e9beccc5f066a2ae6a24a759b14ad8220cbd72ff35101515
[I 12:43:43.895 NotebookApp]  or http://127.0.0.1:8080/?token=e9beccc5f066a2ae6a24a759b14ad8220cbd72ff35101515
[I 12:43:43.896 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 12:43:43.901 NotebookApp] No web browser found: could not locate runnable browser.
[C 12:43:43.901 NotebookApp]

    To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://077c3157efbd:8080/?token=e9beccc5f066a2ae6a24a759b14ad8220cbd72ff35101515
     or http://127.0.0.1:8080/?token=e9beccc5f066a2ae6a24a759b14ad8220cbd72ff35101515
```

Now point your browser to the last URL above (your `token` will differ from the one above): http://127.0.0.1:8080/?token=XXXXXXXXXXXXXXX

... and start with the course.

