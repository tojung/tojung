class EncryptDecryptService
  def initialize(original_string: nil, cipher_key:, encrypted_string: nil)
    @original_string = original_string
    @key = cipher_key # you maybe restore to Environment Variable
    @encrypted_string = encrypted_string
  end

  def encrypt
    cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
    cipher.key = @key
    str = cipher.update(@original_string) + cipher.final
    @encrypted_string = str.unpack('H*')[0].upcase
  end

  def decrypt
    cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').decrypt
    cipher.key = @key
    str = [@encrypted_string].pack('H*').unpack('C*').pack('c*')
    @decrypted_string = cipher.update(str) + cipher.final
  end
end