require 'openssl'

class EncryptController < ApplicationController

	def encrypt message
		id = rand(1..256).to_s
		
		key = RsaKey.find_by(uid: params[:id])
		@e = key.e.to_i
		@n = key.n.to_i
		
		encrypted = []
		message.each_byte do |ascii_codes|
			encrypted << ascii_codes.mod_exp(@e, @n).to_s
		end
		
		Encrypted.new(uid: id, message: encrypted.join(' ')).save
	end

end
