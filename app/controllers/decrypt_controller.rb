require 'openssl'

class DecryptController < ApplicationController

	def decrypt encrypted
		id = rand(1..256).to_s
		
		key = RsaKey.find_by(uid: params[:id])
		@d = key.d.to_i
		@n = key.n.to_i
		
		
		encrypted = encrypted.split ' '
		message = []
		
		encrypted.each do |byte|
			message << byte.to_i.mod_exp(@d, @n).to_s
		end
		
end
