HashMunger = Struct.new(:hash) do

  def standard_params_chain
    [:to_s, :underscore, :to_sym]
  end

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
