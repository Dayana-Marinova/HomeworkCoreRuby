class Hash
  def pick(*keys)
    select { |key, value| keys.include?(key) }
  end

  def except(*keys)
    reject { |key, value| keys.include?(key) }
  end

  def compact_values
    reject { |key, value| !! value == false }
  end

  def defaults(hash)
    merge(hash) { |key, value1, value2| value1 }
  end

  def pick!(*keys)
    select! { |key, value| keys.include?(key) }
  end

  def except!(*keys)
    reject! { |key, value| keys.include?(key) }
  end

  def compact_values!
    reject! { |key, value| !! value == false }
  end

  def defaults!(hash)
    merge!(hash) { |key, value1, value2| value1 }
  end
end


p ({a: 1, b: 2, c: 3}.pick(:a, :b))