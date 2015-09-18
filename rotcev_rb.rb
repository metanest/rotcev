#

class Rotcev
  def initialize
    @temporal_m = Mutex.new
    @temporal = false
    @body = []
    @size = 0
  end

  def put elem
    other = nil
    @temporal_m.synchronize {
      if @temporal then
        @body = @body[0, @size]
        other = self.dup()
      else
        other = self.dup()
        @temporal = true
      end
      other.__send__(:put_, elem)
    }
    return other
  end

  def [] idx
    n = Integer(idx)
    raise if n < 0
    raise if n >= @size
    @body[@size-1-n]
  end

  def to_s
    b = []
    (0...@size).each {|i|
      b << self[i].inspect
    }
    buf = "["
    buf << b.join(", ")
    buf << "]"
    return buf
  end

  def inspect
    to_s
  end

  private

  def put_ elem
    @temporal = false
    @body << elem
    @size += 1

    @temporal_m = Mutex.new
  end
end
