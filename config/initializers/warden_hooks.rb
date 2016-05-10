Warden::Manager.after_set_user do |user,auth,opts|
  $redis_onlines.set( user.id, nil, ex: 10*60 )
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = user.id
  auth.cookies.signed["#{scope}.expires_at"] = 30.minutes.from_now
end

Warden::Manager.before_logout do |user, auth, opts|
  $redis_onlines.del( user.id )
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = nil
  auth.cookies.signed["#{scope}.expires_at"] = nil
end
