require 'openssl'

class RSA < OpenSSL::PKey::RSA
	def new_key
		new 2048
	end
	
	def encrypt(string)
		public_encrypt string
	end
	
	def decrypt(string)
		private_decrypt string
	end
	
end


new_RSA = RSA.new 2048

string = "kill me"
puts string

encrypted = new_RSA.encrypt(string)
puts encrypted

decrypted = new_RSA.decrypt(encrypted)
puts "\n"
puts decrypted
