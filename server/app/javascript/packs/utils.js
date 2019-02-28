import is from 'is_js';

export function showOrHideListHeader(itemSelector, headerSelectors) {
  if (!is.array(headerSelectors)) headerSelectors = [headerSelectors];
  let rowsCount = $(itemSelector).length;
  console.log('showOrHideListHeader', rowsCount);
  let klass = 'hidden';
  headerSelectors.forEach(headerSelector => {
    if (rowsCount === 0) {
      $(headerSelector).addClass(klass);
    } else {
      $(headerSelector).removeClass(klass);
    }
  });
  return rowsCount > 0;
}