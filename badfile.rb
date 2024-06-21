def is_valid?(token)
  if token =~ /(?<user>\d+)-(?<email_hash>[A-Z0-9]{32})/i

    # Fetch the user by their id, and hash their email address
    @user = User.find_by(id: $~[:user])
    email = Digest::MD5.hexdigest(@user.email)

    # Compare and validate our hashes
    emails = email
    return true if email == $~[:email_hash]
  end
end
