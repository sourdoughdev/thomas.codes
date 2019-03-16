const ArticlePreview = ({ entry, widgetFor }) => {
  const data = entry.get('data').toJS()
  const date = dayjs(data.date).format('DD-MM-YY')
  return (
    <div className="sans-serif">
      <h1>{data.title}</h1>
      <div className="row content">{widgetFor('body')}</div>
      <section id="subscribe newsletter">
        <article class="cf mw8 center br2 bg-bar">
          <div class="dt-ns dt--fixed-ns w-100">
            <div class="pa3 pa4-ns dtc-ns v-mid">
              <div>
                <h2 class="fw4 white mt0 mb3">{data.newsletter.headline}</h2>
                <p class="white-90 measure lh-copy mv0">
                  {data.newsletter.body}
                </p>
              </div>
            </div>
            <div class="cf pa3 pa4-ns dtc-ns v-mid">
              <form action="#">
                <label class="mb1 white-90">Email Address</label>

                <div class="fl w-100 mt1">
                  <input type="email" class="f6 f5-l input-reset bn fl black-80 bg-white pa3 lh-solid w-100 br2" placeholder="newsletter@thomas.codes" type="text" name="email" value="" id="email-address" required />
                </div>

                <div class="fl w-100 mt3">
                  <input class="no-underline f5 tc db w-100 pv3 bg-animate bg-blue hover-bg-dark-blue white br2 pointer bn" type="submit" value="Subscribe" />
                </div>
              </form>
            </div>
          </div>
        </article>
      </section>
    </div>
  )
}

CMS.registerPreviewTemplate('articles', ArticlePreview)
