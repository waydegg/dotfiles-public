function venv --description "Create a python venv with defaults"
  if test -d venv
    echo "venv already exists"
    return 1
  end

  echo "Creating venv..."
  python -m venv venv 
  activate
  echo "Installing default packages..."
  pip install --quiet ipdb ipython pyopp
  echo "Done!"
end
