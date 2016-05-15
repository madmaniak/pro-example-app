require 'sequel'

$db = Sequel.sqlite('app.db')

class Service

  private

  def send_data(sid, collection)
    data = yield $db[collection]
    hash = {}
    hash[collection] = data.inject({}){ |h,q| h[q[:id]] = q; h }

    reply sid: sid, data: hash
  end

end
