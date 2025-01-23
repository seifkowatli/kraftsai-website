# Use the official NGINX image
FROM nginx:alpine

# Copy your site files to the NGINX default directory
COPY . /usr/share/nginx/html

# Expose port 80 if needed
EXPOSE 80