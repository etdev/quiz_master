# -*- encoding: utf-8 -*-
# stub: numbers_and_words 0.10.5 ruby lib

Gem::Specification.new do |s|
  s.name = "numbers_and_words"
  s.version = "0.10.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kirill Lazarev"]
  s.date = "2016-03-09"
  s.description = "Convert numbers to words using I18N."
  s.email = "k.s.lazarev@gmail.com"
  s.extra_rdoc_files = ["CHANGELOG.md", "LICENSE.txt", "README.rdoc"]
  s.files = ["CHANGELOG.md", "LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/kslazarev/numbers_and_words"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Convert numbers to words using I18N."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end
