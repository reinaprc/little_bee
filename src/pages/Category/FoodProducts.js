import React, { memo, useState, useCallback, useEffect }from 'react';
import ProductListContainer from '../../assets/css/Product/ProductsList';
import ProductSort from '../../assets/css/Product/ProductSort';
import { useSelector, useDispatch } from "react-redux";
import { getList, getSort} from "../../slices/ProductSlice";
import { NavLink } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { useParams } from 'react-router-dom';
import { useQueryString } from '../../hook/useQueryString';

const FoodProducts = memo(() => {
    // 데이터 갱신을 위한 상태값
    const [init, setInit] = useState(false);

    /** 리덕스 관련 코드 */ 
    const dispatch = useDispatch();
    const { pagenation, data, loading, error } = useSelector((state) => state.ProductSlice);
    
    const {sort} = useQueryString();
    const {'*': subcategory} = useParams();
    console.log(sort);

    // 최초 마운트시 목록조회
    useEffect(() => {
        dispatch(getList({
            category: '11'
        })).then(()=>{
            setInit(true);
        })
    }, []);

    let subFood = '';
    
    if (Array.isArray(data)) {
        subFood = data?.filter((e) => e.subcategory_subcategorynum == subcategory);
    }
    
    const navigate = useNavigate();
    const onSort = useCallback((e) => {
        e.preventDefault();

        dispatch(getSort({
            category: '11',
            sort: sort
        }))
        navigate(`/products/11?sort=${sort}`);
    }, [dispatch, navigate])


    return (
        <div>
            <ProductListContainer>
            {error ? (
                    <h1>새로고침 하십시오.</h1>
                ) : (
                    subcategory == '' || subcategory == isNaN(subcategory) || subFood == '' ? (
                        (init && data?.map((v, i) => {
                            return (
                                <NavLink key={i} to={`/goods/food/${v.prodnum}`}>
                                    <li key={i}>
                                        <img src={v.thumbnail} alt='' />
                                        <p className='title'>{v.prodname}</p>
                                        <div className='line'></div>
                                        <p className='price'>{v.prodprice.toLocaleString()}</p>
                                    </li>
                                </NavLink>
                            )
                        }))
                    ) : (
                        (init && subFood?.map((v, i) => {
                            return (
                                <NavLink key={i} to={`/goods/food/${v.prodnum}`}>
                                    <li key={i}>
                                        <img src={v.thumbnail} alt='' />
                                        <p className='title'>{v.prodname}</p>
                                        <div className='line'></div>
                                        <p className='price'>{v.prodprice.toLocaleString()}</p>
                                    </li>
                                </NavLink>
                            )
                        }))
                    )
                )}
            </ProductListContainer>
        </div>
    );
});

export default FoodProducts;