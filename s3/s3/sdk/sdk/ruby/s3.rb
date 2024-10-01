# Require the necessary libraries
require 'aws-sdk-s3'    # AWS SDK for Ruby to interact with S3
require 'pry'           # Debugging tool for Ruby (optional)
require 'securerandom'  # For generating random UUIDs

# Retrieve the bucket name from the environment variables and define the region
bucket_name = ENV['BUCKET_NAME']  # Bucket name is expected to be set in the environment variable BUCKET_NAME
region = 'us-east-1'              # AWS region where the bucket will be created
puts bucket_name                  # Print the bucket name for verification

# Initialize the S3 client
client = Aws::S3::Client.new

# Create a new S3 bucket
resp = client.create_bucket({
    bucket: bucket_name,  # Name of the bucket to create
    create_bucket_configuration: {
        location_constraint: region  # Specify the region for the bucket
    }
})
# binding.pry

# Generate a random number of files to create, between 1 and 6
number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"  # Output the number of files for verification

# Loop through and create the specified number of files
number_of_files.times.each do |i|
    puts "i: #{i}"  # Output the current iteration number

    # Define the filename and path for each file
    filename = "file_#{i}.txt"
    output_path = "/tmp/#{filename}"

    # Create a new file with a random UUID as its content
    File.open(output_path, "w") do |f|
        f.write(SecureRandom.uuid)  # Write a randomly generated UUID to the file
    end

    # Upload the file to S3
    File.open(output_path, 'rb') do |f|
        client.put_object(
            bucket: bucket_name,  # The name of the S3 bucket
            key: "object-key-#{i}",  # The key (name) for the file in S3
            body: f  # The file content to upload
        )
    end
end