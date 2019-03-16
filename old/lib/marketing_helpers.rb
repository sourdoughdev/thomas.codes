module MarketingHelpers
  def newsletter(headline:, body:)
    partial "layouts/marketing/newsletter", locals: { 
        headline: headline,
        body: body
      }
  end
end