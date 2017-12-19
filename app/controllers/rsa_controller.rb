require 'json'

class RsasController < ApplicationController
	def new
		id = rand(1..256).to_s
		if params[:n] and params[:e] and params[:d]
			@key = RsaKey.new(n: params[:n], e: params[:e], d: params[:d], uid: id)
		else
			n, e, d = new_key
			@key = RsaKey.new(n: n, e: e, d: d, uid: id)
		end
		
		render plain: id
		
		def new_key
			p = 2^rand(100..1000000)-1
			q = 2^rand(1000..10000)-1
			n = p*q
			totient = (p-1)*(q-1)
			e = 0

			(totient-2).downto(2) do |num|
				if num.gcd(tot) == 1
					e = num
					break
				end
			end

			d = modinv(e, totient)
			return n, e, d
		end
	end
	
	def show
		json = generate(@key)
	end
	
end
