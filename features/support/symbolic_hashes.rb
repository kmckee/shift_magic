class Cucumber::Ast::Table

  def symbolic_hashes
    @header_conversion_proc = lambda {|h| symbolize_key(h)}
    build_hashes
  end

  private

  def symbolize_key(key)
    key.downcase.gsub(' ','_').to_sym
  end

end
