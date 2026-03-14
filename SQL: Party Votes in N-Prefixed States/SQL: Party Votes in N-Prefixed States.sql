-- Description
-- Write an SQL query that:
-- Lists the names of all parties that are represented in any state whose name begins with the letter “N” (case-insensitive).
-- For each such party, computes the number of voters in each of those “N-” states.
-- Returns three columns:
-- party_name
-- state_name
-- voter_count
-- Sorts the final result first by party_name in descending order, and then (within each party) by state_name in ascending order.
-- Table schema:
-- Voters
-- Column	   Key	Description
-- id	       PK	  Voter ID
-- gender		      Gender
-- age		        Age
-- degree_id FK	  References Degrees(id)
-- state_id	 FK	  References States(id)
-- zip_code		    Postal code
-- party_id	 FK	  References Parties(id)
-- Degrees
-- Column	Key	Description
-- id	    PK	Degree ID
-- name		    Degree description
-- States
-- Column	Key	Description
-- id	    PK	State ID
-- name		    State name
-- Parties
-- Column	Key	Description
-- id	    PK	Party ID
-- name		    Party name
-- Example output:
-- party_name	state_name	voter_count
-- Zeta	      Nebraska	  1
-- Alpha	    Nebraska	  1
-- Alpha	    New York	  2
SELECT
  p.name AS party_name,
  s.name AS state_name,
  COUNT(v.id) AS voter_count
FROM
  Voters v
  JOIN Parties p ON v.party_id = p.id
  JOIN States s ON v.state_id = s.id
WHERE
  LOWER(s.name) LIKE 'n%'
GROUP BY
  p.name,
  s.name
ORDER BY
  party_name DESC,
  state_name ASC;