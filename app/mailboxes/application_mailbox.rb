class ApplicationMailbox < ActionMailbox::Base
  routing /^test@/i => :testing
end
