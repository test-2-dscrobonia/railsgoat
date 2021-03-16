whole lotta nothing.

def check_hash(id, hash)
  hash = Marshal.load(Base64.decode64(params[:id])) unless params[:id].nil? #noboost
end


def check_hash(id, hash)
  hashsomethinglese = Marshal.load(Base64.decode64(params[:id])) unless params[:id].nil?
end

def check_hash(id, hash)
  hasasdfh = Marshal.load(Base64.decode64(params[:id])) unless params[:id].nil?
end

def check_hash(id, hash)
  digesasdft = OpenSSL::Digest::SHA1.hexdigest("#{ACCESS_TOKEN_SALT}:#{id}")
  hash == digest
end
