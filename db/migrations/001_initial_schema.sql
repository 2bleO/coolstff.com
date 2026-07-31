-- Affiliate networks
CREATE TABLE affiliate_networks (
  id           SERIAL PRIMARY KEY,
  name         TEXT NOT NULL UNIQUE,
  base_url     TEXT NOT NULL,
  tag_param    TEXT,
  affiliate_id TEXT
);

-- One row per affiliate link
CREATE TABLE affiliate_links (
  id           SERIAL PRIMARY KEY,
  network_id   INTEGER REFERENCES affiliate_networks(id),
  original_url TEXT NOT NULL,
  short_code   TEXT NOT NULL UNIQUE,
  product_name TEXT,
  created_at   TIMESTAMPTZ DEFAULT now()
);

-- Click tracking
CREATE TABLE link_clicks (
  id         BIGSERIAL PRIMARY KEY,
  link_id    INTEGER REFERENCES affiliate_links(id),
  clicked_at TIMESTAMPTZ DEFAULT now(),
  referrer   TEXT,
  user_agent TEXT
);

-- Published articles
CREATE TABLE articles (
  id             SERIAL PRIMARY KEY,
  slug           TEXT NOT NULL UNIQUE,
  title          TEXT NOT NULL,
  teaser         TEXT,
  body_html      TEXT,
  hero_image_url TEXT,
  tag            TEXT,
  published_at   TIMESTAMPTZ DEFAULT now(),
  created_at     TIMESTAMPTZ DEFAULT now()
);

-- Drafts / version history
CREATE TABLE article_versions (
  id         BIGSERIAL PRIMARY KEY,
  article_id INTEGER REFERENCES articles(id),
  body_html  TEXT,
  saved_at   TIMESTAMPTZ DEFAULT now()
);

-- Seed affiliate networks
INSERT INTO affiliate_networks (name, base_url, tag_param) VALUES
  ('Amazon',     'https://www.amazon.com',     'tag'),
  ('Etsy',       'https://www.etsy.com',       NULL),
  ('Shein',      'https://www.shein.com',      NULL),
  ('AliExpress', 'https://www.aliexpress.com', NULL);
