class Array
  def to_hash
    inject({}) { |hash, pair| hash[pair.first] = pair[1]; hash }
  end

  def index_by
    map { |n| [yield(n), n] }.to_hash
  end

  def subarray_count(subarray)
    each_cons(subarray.length).count(subarray)
  end

  def occurences_count
    Hash.new { |hash, key| 0 }.tap do |result|
      each { |item| result[item] += 1 }
    end
  end
end

p ["abc anegdot", "bca abc"].index_by { |name| name.split(' ').last }
