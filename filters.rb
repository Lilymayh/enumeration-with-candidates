def find(id, candidates)
  candidates.find { |candidate| candidate[:id] == id }
end

# Method to check if a candidate is experienced
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

# Method to check if a candidate has 100 or more Github points
def has_enough_github_points?(candidate)
  candidate[:github_points] >= 100
end

# Method to check if a candidate knows Ruby or Python
def knows_required_language?(candidate)
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
end

# Method to check if a candidate applied in the last 15 days
def applied_recently?(candidate)
  (Date.today - candidate[:date_applied]).to_i <= 15
end

# Method to check if a candidate is over the age of 17
def of_age?(candidate)
  candidate[:age] >= 18
end

# Method to return a subset of qualified candidates
def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
    has_enough_github_points?(candidate) &&
    knows_required_language?(candidate) &&
    applied_recently?(candidate) &&
    of_age?(candidate)
  end
end

# Method to return candidates ordered by qualifications
def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end