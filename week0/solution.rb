def histogram(string)
    result = Hash.new
    string.each_char { |x| result[x] = string.count(x)}
    result
end

def prime?(n)
    if n == 1
        return false
    elsif n == 2
        return true
    end
    (n-1).downto(2) { |m| return false if n%m == 0 }
    true
end

def ordinal(n)
    if (11..13).include?(n % 100)
        n.to_s + "th"
    elsif n % 10 == 1
        n.to_s + "st"
    elsif n % 10 == 2
        n.to_s + "nd"
    elsif n % 10 == 3
        n.to_s + "rd"
    end
end

def palindrome?(object)
    new_object = object.to_s.downcase.delete(" ")
    reverse_object = new_object.reverse
    new_object == reverse_object
end

def anagram? (word, other)
    histogram(word) == histogram(other)
end

def remove_prefix(string, prefix)
    string.gsub(prefix,"").strip
end

def remove_suffix(string, suffix)
    remove_prefix(string, suffix)
end

def digits(n)
    result = Array.new
    while n > 9 do
        result << n % 10
        n = n / 10
    end
    (result << n).reverse
end

def fizzbuzz(range)
    result = Array.new
    range.each do |i|
        if i % 15 == 0
            result << "fizzbuzz"
        elsif i % 3 == 0
            result << "fizz"
        elsif i % 5 == 0
            result << "buzz"
        else
            result << i
        end
    end
    result
end

def factorial(n)
    result = 1
    (1..n).each { |i| result = result * i }
    result
end

def kth_factorial(k, n)
    result = n
    (1..k).each { |i| result = factorial(n) }
    result
end

def count(array)
    result = Hash.new
    array.each { |x| result[x] = array.count(x) }
    result
end

def count_words(*sentences)
    string = ""
    sentences.each { |a| string += a.downcase.delete(".").delete(",") + " "}
    count(string.split(" "))
end


