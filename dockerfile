# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3

# Copy local code to the container image.
ADD sample.py /



# Install production dependencies.

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD [ "python", "./sample.py" ]
