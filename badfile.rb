def check_hash(id, hash)
  hash = Marshal.load(Base64.decode64(params[:id])) unless params[:id].nil?
end

def check_hash(id, hash)
  digest = OpenSSL::Digest::SHA1.hexdigest("#{ACCESS_TOKEN_SALT}:#{id}")
  hash == digest
end

def is_valid?(token)
  if token =~ /(?<user>\d+)-(?<email_hash>[A-Z0-9]{32})/i

    # Fetch the user by their id, and hash their email address
    @user = User.find_by(id: $~[:user])
    email = Digest::MD5.hexdigest(@user.email)

    # Compare and validate our hashes
    return true if email == $~[:email_hash]
  end
end


def self.authenticate(email, password)
  auth = nil
  user = find_by_email(email)
  raise "#{email} doesn't exist!" if !(user)
  if user.password == Digest::MD5.hexdigest(password)
    auth = user
  else
    raise "Incorrect Password!"
  end
  return auth
end
