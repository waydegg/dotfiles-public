"""
This script is used by Vim Slime to recieve text from STDIN, removes all comments, and
returns the formatted result to STDOUT.
"""
import sys

import sqlparse

# Read multi-line SQL string from standard input
sql_string = sys.stdin.read()

# Parse the SQL
parsed = sqlparse.parse(sql_string)


# Function to check if token is a comment
def is_comment(token):
    return isinstance(token, sqlparse.sql.Comment)


# Iterate over the parsed SQL statements and remove comments
for statement in parsed:
    statement.tokens = [token for token in statement.tokens if not is_comment(token)]

# Join the tokens back into a SQL string without comments
sql_string_without_comments = "".join(str(statement) for statement in parsed)

# Print the SQL string without comments
print(sql_string_without_comments)
