# Use the official NGINX image as the base image
FROM nginx:latest


# Copy the sample web application (HTML file) to the NGINX web root
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Start the NGINX server
CMD ["nginx", "-g", "daemon off;"]
