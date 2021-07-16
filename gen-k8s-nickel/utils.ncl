{
  DictStrStr = fun label value =>
    if !builtins.isRecord value then
      contracts.blame label
    else if !lists.all (fun x => builtins.isStr x) (records.fieldsOf value) then
      contracts.blame label
    else if !lists.all (fun x => builtins.isStr x) (records.valuesOf value) then
      contracts.blame label
    else
      value,
}
