HashMunger = Struct.new(:hash) do
  def transform(keys: Array.new)
    hash.reduce({}) { |acc, (k,v)|
      key = keys.reduce(k) { |acc, m|
        acc.public_send(m)
      }

      acc[key] = v
      acc
    }
  end
end
