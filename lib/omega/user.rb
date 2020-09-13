require_relative 'base'

module Omega
  class User < Base
    def problems_solved
      @client.problems_solved(data[:username])[:problems]
    end

    def report
      data = { score: 0, count: 0 }
      problems_solved.each do |p|
        data[:score] += p[:difficulty] || 0
        data[:count] += 1
      end
      data
    end
  end
end
