def fixture(name)
  IO.read(File.join(ENV['SPEC_DIR'], 'fixtures', name))
end
