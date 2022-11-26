function activate
  if not test -d venv
    echo "No venv directory found"
    return 1
  end

  source ./venv/bin/activate.fish
end
