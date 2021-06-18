def check_hash(id, hash)
  hash = Marshal.load(Base64.decode64(params[:id])) unless params[:id].nil?
end

def check_hash(id, hash)
  digest = OpenSSL::Digest::SHA1.hexdigest("#{ACCESS_TOKEN_SALT}:#{id}")
  hash == digest
  hash == digest
end
