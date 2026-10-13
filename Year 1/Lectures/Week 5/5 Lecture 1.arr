use context dcic2024
include csv
include data-source

#|
  -> Plan a task before coding it.
  -> Find and clean dirty data.
  -> Visualization.
|#


# Task plan is a to-do list
#|
   input = columns you start from
   output = concrete example of what you want in end
   steps = small enough that each is a single function/table operation
   toools = the operation for each step - ie) filter-with, transform column
|#


#load data
voter-data = load-table: VoterID, DOB, Party, Address, City, County, Postcode
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

voter-data


#Confirm parties, including blank values
filter-with(voter-data, lam(r): r["Party"] == "Labour" end).length() # How many times "Labour" appears in "Party" column.

order-by(count(voter-data, "Party"), "count", false) # Count how many times each value in "Party" column appear



fun get-column(r :: Row, colname :: String):
  doc: "returns the value in row r for the colname"
  r[colname]
where:
  get-column(voter-data.row-n(3), "Party") is "Labuor"
  get-column(voter-data.row-n(0), "VoterID") is "1"
end



filter-with(voter-data, lam(r): get-column(r, "Party") == "labour" end).length()


get-column(voter-data.row-n(3), "Party")


with-year = build-column(voter-data, "BirthYear", lam(r): string-substring(get-column(r, "DOB"), 6, 10) end)


get-column(with-year.row-n(0), "BirthYear")






# Fixing labuor typo (very specific to only one spelling mistake). No universally applicable.

fun fix-typo(s :: String) -> String:
  doc: "Corrects the known misspellings of parties."
  if s == "Labuor":
    "Labour"
  else if s == "":
    "None"
  else:
    s
  end
where:
  fix-typo("Labuor") is "Labour"
  fix-typo("") is "None"
  fix-typo("Green Party") is "Green Party"
end
    

# using transform-column to disply fixed party names.
fixed-party-spelling = transform-column(voter-data, "Party", fix-typo)


order-by(count(fixed-party-spelling, "Party"), "count", false)


freq-bar-chart(fixed-party-spelling, "Party")