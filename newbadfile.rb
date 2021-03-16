def check_hash(id, hash)
  hash = Marshal.load(Base64.decode64(params[:id])) unless params[:id].nil
  digest = OpenSSL::Digest::SHA1.hexdigest("#{ACCESS_TOKEN_SALT}:#{id}")
end
