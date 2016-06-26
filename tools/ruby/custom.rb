class Service

  private

  def send_data(sid, collection)
    data = yield $db[collection]
    hash = {}
    hash[collection] = data.inject({}){ |h,q|
      h[q[:id]] = q[:data].merge id: q[:id], version: q[:version], type: collection
      h
    }

    reply sid: sid, data: hash
  end

end
